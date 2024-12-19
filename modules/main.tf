resource "terraform_data" "install_op_cli" {
  input = timestamp()

  triggers_replace = [
    timestamp()
  ]

  provisioner "local-exec" {
    command = <<EOH
ARCH="amd64"; \
    OP_VERSION="v$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"; \
    curl -sSfo op.zip \
    https://cache.agilebits.com/dist/1P/op2/pkg/"$OP_VERSION"/op_linux_"$ARCH"_"$OP_VERSION".zip \
    && mkdir -p ${local.tools_path} \
    && unzip -od ${local.tools_path} op.zip \
    && rm op.zip \
    && chmod 0755 ${local.tools_path}/op \
    && export PATH="$PATH:$(pwd)/${local.tools_path}" \
    && echo $PATH \
    && op --version
EOH
  }
}