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
  version 'v0.28.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 'fe24d03036b12c6ea72e6919596dd6216ea2c9578fcf444230329035fa70edbe'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '500f489647a58a93b4a6ddec67cd53adcb7392d3df67ea1233f13588e12aab59'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '2b1d76068ae8e4300b7d6317759fcfc36cbeb0318af3f2b595a92b9eed60c58a'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'f4660bb9b8617001f25e55943bfafd89bfdf3b9e669c0a7af6ab9e1967c55494'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.28.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '8dfc799dd09feb9d74391ca8e07053635a07a6e5ea0a2764ca508660412128c4'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
