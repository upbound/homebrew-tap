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
  version 'v0.34.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'a756f527c2166e0c034ad16d7ee8221a77a4bc49f11b22e33e34c83c5511df34'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '2d3527ecd3b790242338c016367b739ee31f5d816979b9091057599ba1a06425'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'e735e8da7bb6f53f2a545b213be35494a47195c511b82bb1fda911702baf6f8f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'f4a4dc1ff7dc4d1d79089de9c4cb76881b2826f5123a0f27ce75a20afa9e4a41'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '044c3e5372f90c1e215cdc801124018410a8041e5800597d8ca436b890e37138'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
