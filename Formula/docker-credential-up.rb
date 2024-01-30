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
  version 'v0.22.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '657c0e2c5568a236252fc7276373f3d221221b679f4d22be2e4c85e76c23543b'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '67b9237a71bd49d34a6d3e087529736a9f83d34fd10ced4fb146adb5f3d138fd'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '02c0a23e811a53121db87f6fbcb87857b83eea3e347ac2df194baec2b539a0b6'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'f4f6683f9218df6f2bbe04be10cb3f93515f2f4306db40db8844a43c162fc6a2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'aeb2b326e6cb46d92c3753b673b59ffbde1568927592eff1a31b81313e6dd02e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
