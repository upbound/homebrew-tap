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
  version 'v0.15.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '55da059441716a47b51e9adb6b97f291394976b8e5287e8d7736da2232c9e9b6'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '14c8f514679d363c82f7821a60f8ba4868a0b965f065e5f11399479c5cce17cf'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '2d2146c820da89e807472b736f565f93ce94573b1d965915e1f10cdd6844f5a8'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '01c2d16c2bbe752059d9e7346b832d9bd47d19ee1c8919d4dd330b75edf65551'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.15.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '413feb7880dfd15fc2fa5d45c37878c09f8eaaccaaed0c04058e28a10ea0c8dd'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
