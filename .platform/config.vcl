# config.vcl
backend home {
    .host = "fivetran.com";
    .port = "80";
}

sub vcl_recv {
    if (req.url ~ "^/check-static/") {
        set req.backend_hint = home;
    } else {
        set req.backend_hint = main.backend();
    }
}