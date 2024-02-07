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
  version 'v0.24.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '7d16f390040266a8c6746f6d579b2e08d081db2cd6b74701697199eb7c92ac6e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'ce1211c2aeb5512c0380b25d72ca72f61d6ad38de179488faa5f873f6236a68b'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'e4421f7c5da6c5fdf63e17123deac0748fa14de41f38e9d3b6e3cfa2c4e57c24'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '508719718c253734b5b8605b02e8f8e8b1a77fb4c6904048ca070cd9327b4273'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '77e0c5dd5708389139bc9f9cb9ffebaa9d2ef312d9a80c3d33ea524f0ac6db5e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
