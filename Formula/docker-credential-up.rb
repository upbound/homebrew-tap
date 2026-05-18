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
  version 'v0.48.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.2/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '4728d5d727085d64af1f151f8b0e1cf800b76594ee593034ce25fd8177fa7c69'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.48.2/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '8c4601ad6ae23b3d3bb8025496e71e75840a4e822887b60d280665a991b00904'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.2/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '0dc17c07eb1b66f824532e80245e1512bd9d4a070479eec13171799dfddc7ef9'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.48.2/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '9f9342170fc08366d51af32ec61f790cbbf658e7d4c3ee3389442e38226f1370'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
