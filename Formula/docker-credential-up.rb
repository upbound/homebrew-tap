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
  version 'v0.36.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'fe2e15b03524d01fa1b51bf45028c22d3d41c9ec0ef1434738c6dbc6a21fbef1'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '81a69a39f9fca0ec63958aee19e3c567e7bae5c5204494a5b2be22c1e5587521'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'e00d038bdd86fef8bd351fe91f6d04f1a6929ff8d885db906d81fa68b2f64771'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '06711058ad58e2b083124e41824508785d282ba0bbec041987a296852f8c7ea3'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
