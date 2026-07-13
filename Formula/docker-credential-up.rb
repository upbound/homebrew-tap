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
  version 'v0.51.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '3337c6d59ab5d0ddf19e1c95671ecc828b0fe69ee111f1685c74bb051f4a3214'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '4c89e95e9208709eb730e63cc6d979b2f67b6a8fa946b5edb9bf1485e8833498'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'eb344c860cab787541dc974d451eff3850be590e460f61fade521430bb161c73'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '36ac8947986dc33435e12f28ed7b99154bb0ca9556bb4237db2b9bbc2371aafe'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
