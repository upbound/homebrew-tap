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
  version 'v0.17.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '4cab99e77cfa67b14f611fb01a5bb22891028391672e7f52f07885cca415b4ba'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '7c65b4032721f4137bb48e2dce1d93003bf9a348ba9e6cd94572d55096f3877f'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '00e9bf71cb271fc712631252d36d7c716047c1e18d476229ef321e1c3c16202f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '31ac58c0c8ee91c37305bd33be3b4cfd639fc1e0fbab03055e95ebc118d336ec'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.17.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '6870b2afb9efc9bc765d8e75a640d9e3795126e4925e182535248b2d34eba8c5'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
