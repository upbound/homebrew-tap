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
  version 'v0.49.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '104830c8530f486bc355442ae12560688de78c6dcf12267869220924535c53e8'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '5db07ad5e174929f83b4e09dad0085097978ff3cb302acbde7190c519f568686'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'c8aca00cc4f7f46ae1c01eaea311befb7c754312e8e488d6a5cf81fc38797ed6'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.49.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'f2ebd8c7ac8ece770a57f987e23207c96a571903cab5a069853751e48ba7b4ba'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
