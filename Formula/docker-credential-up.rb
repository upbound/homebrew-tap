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
  version 'v0.34.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '03d4564fbe1aac59e12ed8114ce0f6f865f9b3ee701a8e5f3e946e3adf2143a8'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'fc0e4819a3b9cb443671904a3cf5c07a783bd609fa1c7ad7e7149d30d56f0b8f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'a81297ac1ec01b1f195c3feb68d947cba112457b5f836f8fc285823a35737daa'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'c52a8689f800fdf423f8c2999c9d1e7461f03362f714b9fe42b307699217055a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '3352814481259546dbfee461dc1b0d518724772511278a1f59f54f424a1222be'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
