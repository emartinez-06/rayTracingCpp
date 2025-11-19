CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
TARGET = a.out
SRCDIR = src
BUILDDIR = build

SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SRCS))

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(TARGET) $(BUILDDIR)

