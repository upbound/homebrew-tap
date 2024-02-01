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
  version 'v0.24.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/up/darwin_amd64.tar.gz'
    sha256 'cad961d5c8311c574b91b199ca8af5d00679bf83259629319df4fe832bdcfcd9'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'c54b6872145d732e4e82c9935daaafbc622c0ac0d967db7f5f78be0ce23c5934'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/up/linux_amd64.tar.gz'
    sha256 '1496ba5fec14355f0776a8816c813576e8c1732e9ef950e350a93ce504b3bb63'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/up/linux_arm.tar.gz'
    sha256 '12b077f30abd77e69c846193a42a58668cd521cc16e8d94b16380dcd45e23ae7'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.24.0/bundle/up/linux_arm64.tar.gz'
    sha256 '46ec9b7a1f20b9c70df268dfa6bbc2f0963338743ac9399f7cf704eedb818354'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
