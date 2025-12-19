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
  version 'v0.44.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'b9360b05788f17da6c3f5ef6b833bd37ce79145f995e5e3b65fc22efc6581b3f'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '8f0c2375ce2f2d533cdaf121f2a37c07a20fb110eaa9ba709247c2d211e4685d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'd18379ece5f984bbdc5e6e21e2bb49c218306686a883d9a9dd1dfa6b85bd605b'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '465f030f1e9df64cf7cc7479513e7911ac6e8604ae8ce3fd8b436ac63321ae4d'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
