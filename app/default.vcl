vcl 4.0;

backend default {
    .host = "app";  # Nombre del servicio backend, que debe coincidir con el nombre de tu aplicación en Docker Compose
    .port = "3000"; # Puerto en el que corre tu aplicación backend
}

sub vcl_recv {
    if (req.method == "PURGE") {
        if (req.http.X-Forwarded-For == "127.0.0.1") {
            return (purge);
        } else {
            return (synth(405, "Method Not Allowed"));
        }
    }
}

sub vcl_backend_response {
    set beresp.ttl = 10m;
    set beresp.grace = 1h;
}

sub vcl_deliver {
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
    } else {
        set resp.http.X-Cache = "MISS";
    }
}
