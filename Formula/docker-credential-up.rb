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
  version 'v0.38.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '098ed9218a16296b2e18e95e513e7f02eed5c18556e89d1831b113c5d1bcb024'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '90db8fa8bbdf62b1e7c19e0d3c9206ad6fb79d11c276b463a1c1fd2afcca951d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '260b891915f884b51612be6f0e034d566caa698854ce2a256f71c1b9e88ce5b0'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.38.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '0a0220fe977dc600d8d3b21733a1ea780effc0e47d781a07b68b16dd54978c83'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
