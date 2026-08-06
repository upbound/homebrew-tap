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
  version 'v0.53.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/darwin_amd64/up.tar.gz'
    sha256 'f3b9d1884f2751104566923197b4512c01e3566b2ee41c7b234f85934b54f186'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '55d4c6a1b6e6b842b10b9cd9ff3ea042b47712999eaea58a47827f03857ed2c1'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/linux_amd64/up.tar.gz'
    sha256 'b08c01a5ef0ffa4b4f1672aba39ffba51febcba6c386a28ccaad542dff4d465a'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.1/bundle/linux_arm64/up.tar.gz'
    sha256 '61512e905c52ac263ca8814890d97a808bf0a59afc0cbb657e4ac40ea80d4e70'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
