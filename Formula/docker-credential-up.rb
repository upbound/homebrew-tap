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
  version 'v0.40.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '36ee544b3351c9bd53b2dcff51b111884a6d55eb7f7076a34b7f9e63bfdd345d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.40.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '6aa2cc86dcaee2a955a344f55821f4efc300ff295c3fcaca5b183f9fee8f6546'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.40.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'a57831c44d03d33a8e7e65ad5f1dd8c0d7f2c2cfb6ccb160509f5a09571afd57'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.40.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '1c7ae216a08338534279655a2edc9096bc1557ea9119bb5805c1727818ebbbe6'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
