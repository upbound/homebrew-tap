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
  version 'v0.53.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'cbd5bdb268eeb36a9af278f73ebe3cb47122c03838613808869695764f502923'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'e58eec125c82f80f5cde48900cc4c7f20bc86d67df5f8bc2fe57ab141a7fcbfe'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '4723c02cef36dec64fd48d3ee156296e11b4e63e75f4b82ca4443462dafed78e'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'd76212671f76e5160f492019fa0e36961c11bd42a7cc5023f3274b0c94fc24d3'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
