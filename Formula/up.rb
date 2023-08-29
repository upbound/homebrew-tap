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
  version 'v0.19.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '305853f8bbb43f8b3ae547b6d449d386c3a3620b4908646b75cda0fb56574305'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/up/darwin_arm64.tar.gz'
    sha256 'e2a9ce65fcc74170840476c1eced7c1a9e2c1cd90e4c3ff16f8fe28924fedde9'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/up/linux_amd64.tar.gz'
    sha256 '649145a772eb673c9789296d4e47a74d5bef52538f7299b3150fc3ea34fcc027'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/up/linux_arm.tar.gz'
    sha256 'af949b69889318b1ed566a48ae3e3a915a53dcebe883fde583c7457572810248'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/up/linux_arm64.tar.gz'
    sha256 '8220fdbed7f6de2bd4c02aa2ed10ee35a8da8fe49491b72f4b813112b42a8892'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
