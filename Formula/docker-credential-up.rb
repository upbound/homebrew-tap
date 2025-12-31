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
  version 'v0.44.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '06893fc313b5726ccb8b61a8480758216d2ba4b6cf86b524a5a0791bffbfb1cb'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '693c3035f0b4f9333a98e1a5de4a27070aab0ebf9f2af0bc8bbf115ce300a378'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'b71d45eb02901427c6a3f783a83713962bf283ff912d6f7f7a6174391f21524b'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '019725837f979a235f9308ae0ede25513e7f5b81eaec53e45494808d10028fb9'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
