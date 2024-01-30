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
  version 'v0.22.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/up/darwin_amd64.tar.gz'
    sha256 '8aff3375bfdb7ba6c1eed94b59e922b03d69f282c936ebcd00d62e3ca23d7baa'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/up/darwin_arm64.tar.gz'
    sha256 '8abaa201df8da0534bf06d3119eb1524f15f2af24860fa97f6917c5fab5c0d24'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/up/linux_amd64.tar.gz'
    sha256 'b7ae8e22e3d78f695dd128f6d722250760f8e8e6a57944bb8c7710a1d0d9adcb'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/up/linux_arm.tar.gz'
    sha256 '18f588894ac03910a91e84938369e267e4b609cb82bed25bb7cda8b5355dbbbb'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/up/linux_arm64.tar.gz'
    sha256 '99133af5fe751934590ca597eebb4b037c3e96d18d2ed5f1d2648c1bb5cbf667'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
