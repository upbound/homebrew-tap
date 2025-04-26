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
  version 'v0.39.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'c07dca1a145c7438f76c0c136d164388a48dc8a82cc737c546d9992a614273c0'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.39.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '9812f6cad0173ad1b0922b41ce4d550784874b5a19ffdc1cc996c26dfc72164a'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.39.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '54285d9d6509812da678ad0f3ab1771e83c556c9201d342052425a8ffc802050'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.39.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'ec167d32eb3386159f2ba39a0e18a3f10eaa3d7066e7cb162dc3cdfd78c5fd06'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
