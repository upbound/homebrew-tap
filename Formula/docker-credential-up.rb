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
  version 'v0.55.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '08437f8d311752f91fa3e184eddca464e442788679030fc54a257c85a57e1c33'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'b662dc5b379f5740068b9816909e5d22ed1b2fb9c7e6a6e99cd3865677f37d67'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '21e675a17933010d278b705c779ea12d1ce52d75f4caf592e76d10f7c722ca5b'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'dccdddf6c872acb8a987ae5012b446bd88a0871c190bbdb932edb066f5278960'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
