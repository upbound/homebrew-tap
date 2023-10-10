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
  version 'v0.20.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'd3aa455dbc58028f7de5ce22d3ccf77db281f5df1bbb214541bcd45a459a8f48'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '7fbb328f661b541a2921af4592437d5df8c6228738da8966ef347202458320dc'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'd677df6bc563bf6c4e071ccfb94d80ab9466a42c628f452a9618d93c3d7614c5'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'b78e57eadcee896b5be84711f6a2c492fcc0afac7c47a4af1dc6371a896f93d7'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.20.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'af1b1e465baef73ea620077961cfa75ec5a222ba7015fc5dfd5eec90b37b903b'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
