#!/usr/bin/env bash

set -oue pipefail
 
mkdir -p /etc/ntfy
ntfy_tag=$(curl -fsSL https://api.github.com/repos/binwiederhier/ntfy/releases/latest | jq -r .tag_name)
ntfy_version=${ntfy_tag#v}
curl -fsSL "https://github.com/binwiederhier/ntfy/releases/download/$ntfy_tag/ntfy_${ntfy_version}_linux_amd64.tar.gz" | tar -xz
install -Dm755 "ntfy_${ntfy_version}_linux_amd64/ntfy" /usr/bin/ntfy
install -Dm644 "ntfy_${ntfy_version}_linux_amd64/client/client.yml" /etc/ntfy/
install -Dm644 "ntfy_${ntfy_version}_linux_amd64/client/ntfy-client.service" /etc/systemd/system/
install -Dm644 "ntfy_${ntfy_version}_linux_amd64/server/server.yml" /etc/ntfy/
install -Dm644 "ntfy_${ntfy_version}_linux_amd64/server/ntfy.service" /etc/systemd/system/
rm -rf "ntfy_${ntfy_version}_linux_amd64"