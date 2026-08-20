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
  version 'v0.53.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '9673845a77719f22d3831b31a6fe00462aec5d08fbdfd5f9052e3c7654d0db00'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'd2f149717c31dd61611af4158184b275863f81a1376e9c7a13f434719964f92f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '692e3188afdf5756b3b1fe5ddc2d48fd99d8b978b7b53be31f2a8aea58b1b73f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.2/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'a8b41994bc0e74797811b637a1387a004214a74fef0888c6c97ba041013a9100'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
