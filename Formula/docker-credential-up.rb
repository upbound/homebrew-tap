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
  version 'v0.43.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '4baad03d768fd41e2f7edde03892c2f4617a6edc6fc424b91f3e89b47f285f76'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'c22f8711c244b6d3cbd8553f18ec9476a4f3062051633ae5aafb7c3f3a7b5124'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '44706e67481b7ad50f9c3df12bf466466747b073ad8ef9c88a8905fb643cfe96'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.43.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '99fff26f047d64bf78ed46149999853c82c1a0a70453d9242321be11ce591f60'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
