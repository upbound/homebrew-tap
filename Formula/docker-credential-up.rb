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
  version 'v0.55.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'b516f17863092b03cb05cde2fa7f1a7b4c4ad7f520efcfd6378e9701d2feb6a9'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'db3516d7010d3c8a2422d91a310c2ea7252311ac7a33393abd7ca23992621b2e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'c349dcc99d7d48177977f37331e4af90593d0e1478c2e7681827ae5756b6beca'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'e4127a11f2b579267c003bc1f0670a792408581f69be73103b1110be5af1a554'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
