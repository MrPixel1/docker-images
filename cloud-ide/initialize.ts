import * as sh from "shelljs";

sh.set("-e");

sh.cd("/opt");

// Docker support
sh.echo("Installing docker-cli");
sh.exec("curl -o docker-cli.apk http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/x86_64/docker-cli-18.09.8-r0.apk").toEnd("/dev/null");
sh.exec("apk add --no-cache docker-cli.apk").toEnd("/dev/null");

// SSH convenience
let knownHost : string = "";
sh.mkdir("-p", "/home/theia/.ssh");
sh.chmod(700, "/home/theia/.ssh");
sh.echo(knownHost).toEnd("/home/theia/.ssh/known_hosts");

console.log("Initialized");