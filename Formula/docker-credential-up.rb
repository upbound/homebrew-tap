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
  version 'v0.53.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '98c2c95260aaddd62fd716bd772b4cd4ab6c7a55f99447547f708f7d85c436c4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '77453a57366ce27d9eae33f39022d79b003a34f543364851938a834f9bed8b01'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '8ea7353807b4ebc44b5fe2f6792fdef502044cc62796848715df4cdc7e853af2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '76e84d271e1d90ffdd6e969ba82e3b5b00c8d743dab616cf282c6eb907e1c9dc'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
