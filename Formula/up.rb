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

class Up < Formula
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.19.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/up/darwin_amd64.tar.gz'
    sha256 '3ddc4028ce0dfd2a8f0182987fa49f31cb236c9cef9c8f8111d109879c7e0082'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/up/darwin_arm64.tar.gz'
    sha256 '526f5bb1008f1b066705710b7163b32f789e0f2d4854b4537738fb8dba369482'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/up/linux_amd64.tar.gz'
    sha256 '74cd90ba66d78ae7c22505a03da5be2ac96c666c95d4769afd83ee0c33354ec2'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/up/linux_arm.tar.gz'
    sha256 '856114f5e70cac138651893df176fcfa59d55590d7d61f7e29d245c0eeb6f7ad'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.2/bundle/up/linux_arm64.tar.gz'
    sha256 '722b12b7fbb1a04788c1b377ac2aa65d0d312b0d6688759fcfac498cb9ea3c6f'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
