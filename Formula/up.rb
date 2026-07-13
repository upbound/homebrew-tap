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
  version 'v0.51.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/darwin_amd64/up.tar.gz'
    sha256 'a73e3919f7194df34dbc4795bc769e46103839bf8376620e78b383bfa843b1c4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'cbf50a48d88bd0ec32b22528da3889693073669bd1f3d0580d836ed48e9bb509'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/linux_amd64/up.tar.gz'
    sha256 'a1c43d7dedf24957619143b0678897274210b167958ef496872f4bc1761259e3'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.51.0/bundle/linux_arm64/up.tar.gz'
    sha256 '426c38727cfde49491032162e7a799208ee60c1343e4ef5aba7434342a622f2a'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
