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
  version 'v0.44.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'c5b02ea29fc3677e9cd858df648e8063047f3a3c2a0ecf65fd5d278a3f044a54'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '8feabba0dba396bc9b463af304730b74b651471fca2b2d5511f81194fcd96664'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'd435383f7e25d452abd0fef3a7cec904d10fb8827e21813ec4f3578b563439a5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'e304e540d30c3be7e9bfc9ff0add3071d69ed41dfecf767b19ce52fa1234d5c4'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
