# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := fontmanager
DEFS_Debug := \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Debug := \
	-I/home/ryan/.nw-gyp/0.12.3/src \
	-I/home/ryan/.nw-gyp/0.12.3/deps/uv/include \
	-I/home/ryan/.nw-gyp/0.12.3/deps/v8/include \
	-I$(srcdir)/node_modules/nan

DEFS_Release := \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Release := \
	-I/home/ryan/.nw-gyp/0.12.3/src \
	-I/home/ryan/.nw-gyp/0.12.3/deps/uv/include \
	-I/home/ryan/.nw-gyp/0.12.3/deps/v8/include \
	-I$(srcdir)/node_modules/nan

OBJS := \
	$(obj).target/$(TARGET)/src/FontManager.o \
	$(obj).target/$(TARGET)/src/FontManagerLinux.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS := \
	-lfontconfig

$(obj).target/fontmanager.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/fontmanager.node: LIBS := $(LIBS)
$(obj).target/fontmanager.node: TOOLSET := $(TOOLSET)
$(obj).target/fontmanager.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/fontmanager.node
# Add target alias
.PHONY: fontmanager
fontmanager: $(builddir)/fontmanager.node

# Copy this to the executable output path.
$(builddir)/fontmanager.node: TOOLSET := $(TOOLSET)
$(builddir)/fontmanager.node: $(obj).target/fontmanager.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/fontmanager.node
# Short alias for building this executable.
.PHONY: fontmanager.node
fontmanager.node: $(obj).target/fontmanager.node $(builddir)/fontmanager.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/fontmanager.node
