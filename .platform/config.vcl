# config.vcl
backend home {
    .host = "fivetran.com";
}

sub vcl_recv {
    set req.backend_hint = home;
}