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
  version 'v0.37.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'e67afee6d09baa855e97ded13a7d8e6a6574b3dd0ee904bdbeb6d25c88e1268a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/up/darwin_arm64.tar.gz'
    sha256 '8c38400746f55cc0301a04de2f5b97208838628060a6023d28176c6f20578c5e'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/up/linux_amd64.tar.gz'
    sha256 '3198109718b832bcd71b9f50e20e418dbdb8d04e697f99756c71804aa49cf8e5'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.37.0/bundle/up/linux_arm64.tar.gz'
    sha256 '9954b5927343b508dbc63d855c8cb1fe6fc75548544ae37613b1cd99dc60b5de'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
