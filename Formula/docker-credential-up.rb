# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.16.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '62307a7055975649c35f321124bf692ea221f0b7f271dc94540dd85c607ba2a4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '92e4f366375525ea5c88ce1774b83f2ff76bfa732c09452505696ae31112e933'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '5221e476473132d72860b9f571b05197d0eb78b4448b577af8df0ada61835083'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'cf3d74d0279da030c8005ce0eb1339f266fd6e7f7c46d8b5cd9cf7b062095d34'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.16.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '30d7a0afb41acaa254469eac6b195bb2ac1be66f7a3bfc52a93b64d16613b08b'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
