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
  version 'v0.38.4'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '5e28b210c55bf1b863989ae87c4d93fd5820fa934137152fd3228a9bdac8c7ee'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '850a5976a136ee3097206a7e63b7dd5687013cce8f279d19f7f972d10bc5b289'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '477a6061ba1eadbf2055cd6c0e66551d8e78d723b403784861e222675c2b4f38'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.4/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '4878d88dfe300bc1ba2a917e5bce942c8d42c151fdddb80a2d3a1fe4cf70bd9e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
