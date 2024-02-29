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
  version 'v0.24.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '18f428011af815f9f63355cc80c461008e44171e4b591d247e95bc0251a9881c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '436caaa1efbd3dbaf04106ec3af0608e6c2028a9720cb1e2651e58d0d3f022fd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '5fd9c3b98cf65e62fd2cbdb10a02b4ee86e4443caa07eb136e38ad1f0742aafa'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '7623c59bc8180d54b387ac4f36d4228a6abaec3cbd44627782711eabb1600428'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.2/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '33fc1b8b62857c7c731835fdae941e7217626e2146235bfbdb69d3bb7b61fd8e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
