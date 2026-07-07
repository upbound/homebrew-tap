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
  version 'v0.50.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'c1b2b4f3c38a179bd8cecb5118244e58aad3973e4a0b1c3b8ad322d2700bc98b'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '834b1999f374ee3193524b5508aca52a7b393782d04ee0a280d36aae5923d0a9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '01e073f3101055457b8dbbeb9d2eea3b742a06abb997ddbd56ad4715e6ac8b88'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.50.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'd85b03e76df2de66c62797fd954d244eb71ae21b3e0a3b35091ca4dd203b7cdf'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
