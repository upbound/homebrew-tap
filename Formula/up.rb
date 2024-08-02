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
  version 'v0.32.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'f0e01e77e70a24f3a0864820ddf9f15ac3c5033f6440feceefc0320c12cbb703'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'a03616ca5da324ccc5f5c766704ea8579c922bb5769fa9f6c6500ceae1c5a1ee'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/up/linux_amd64.tar.gz'
    sha256 '8c08df7b204d8ec1dc03b57d2ffbbfeaf0c0f5e3bc1985107c4c47f229c0a456'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/up/linux_arm.tar.gz'
    sha256 '592c3e9855b94424f5310e40636ff93e78f6b0f8417229ef26840272a5ad6a56'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.0/bundle/up/linux_arm64.tar.gz'
    sha256 '6e9018ee68598c63370eccaa95f784c7cc4911e4da047043b4a5e7ed87e2d0bf'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
