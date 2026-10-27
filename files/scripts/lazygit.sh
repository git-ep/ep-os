#!/usr/bin/env bash

set -oue pipefail
 
lazygit_tag=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | jq -r .tag_name)
lazygit_version=${lazygit_tag#v}
curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/$lazygit_tag/lazygit_${lazygit_version}_linux_x86_64.tar.gz" | tar -xz -C /tmp/test lazygit
