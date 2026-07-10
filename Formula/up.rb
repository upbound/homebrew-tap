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
  version 'v0.50.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/darwin_amd64/up.tar.gz'
    sha256 'f2b3bec5cb3c73fe782982f8ebd3cac59852793628b0273741af066806d8a7a2'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/darwin_arm64/up.tar.gz'
    sha256 '95e4d4fd270af8c61405c45625c513957f380790abe5013500c1538ee0717991'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/linux_amd64/up.tar.gz'
    sha256 '52265a59817344d86ac92c66890340fca1fe692c2e476838da55e767c677116f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/linux_arm64/up.tar.gz'
    sha256 'b24b964d5ff86dec8379d3f42b2495f97715ff0cb7da983ad1b73e844deb88f1'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
