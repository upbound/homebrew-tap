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
  version 'v0.48.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'dff65cf68dd9a7a92a7eca2ad6033e521e1120be308d7f7424f546fd8dab827e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '883a2975cb28a923f94c9f73ee3014d85d2bbacd1b3e109f15a48a371928aa29'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '85a9ec17c0a436ef9ca5f1130bd3459bb4bc00d58b4339d878bb0a5bfca19395'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.48.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '28c539d1b38034bf38ad78966610e769754f61c90d38fc69f24d16c3a371cd4d'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
