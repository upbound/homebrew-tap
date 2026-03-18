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
  version 'v0.46.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '6813b9af67565df92fc091ae78046a13ae2976e9894ea079240d59429a9b2671'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'b7ff44a63526d941ce709e5141f582bad78010c94df5f9f5f8dcfdc3ac6150ad'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'c01b9d3b9ee2cb0d0e66436a14223c174a39fd6a85c3121dd7dd21e42f44ad38'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.46.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'c9310266afccae7618de10141ca9b3e1d467c4aaac78e850819150f29d753563'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
