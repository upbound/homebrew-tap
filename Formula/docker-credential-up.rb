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
  version 'v0.27.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'c99afd34e6a8fa01cd1437ad5c7fa32dc91fcbf67a9b29af9526f704699f0830'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '24b8e9aca485a73709dafbd1f79a7159fc171edd86c6992ac7504fccd0587d73'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '9ee63e398e4619336cf1b6818546dac0cc8200254e2b729550b7ebeb8be99b31'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '2cc1673adcf495656b84056e5935eca63f0e2a694dd3e200ee7a96218ef7b79f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'ca5054c4615073eb6f55898db6995615efb78e82c1f9a64fcf8a120264603a1f'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
