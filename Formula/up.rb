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
  version 'v0.34.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/up/darwin_amd64.tar.gz'
    sha256 '1b11f9ba3c9643807343a0b1e6f437c04a04ca5c408931dc6bb963f6554fb58e'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/up/darwin_arm64.tar.gz'
    sha256 '8ded6d6f11345cf05d745a2fff6229bd36a8d721d7b77dfc757fa9f17c22a4ff'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/up/linux_amd64.tar.gz'
    sha256 '91a040afcb96f6fce0485609bc4adff70b982d9109ee2ec28e88ccfe874c82a7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/up/linux_arm.tar.gz'
    sha256 '629aa94874b37e45679ed06cc85fd61c534c98ce82edd21adc892e6f4da064a5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.34.2/bundle/up/linux_arm64.tar.gz'
    sha256 '97680d29a8042ce8acf729f6e213429879ea574b75730a136f86c81898d5b193'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
