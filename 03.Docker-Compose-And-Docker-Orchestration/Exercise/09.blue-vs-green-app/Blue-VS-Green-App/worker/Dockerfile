FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder

# Create a working directory
WORKDIR /worker

# Copy the .csproj file and restore
COPY /src/Worker/Worker.csproj .
RUN dotnet restore Worker.csproj

# Copy source files to the image
COPY /src .

# Build the project
RUN dotnet publish "./Worker.csproj" -c Release -o /app/publish

# Specify app image
FROM mcr.microsoft.com/dotnet/core/runtime:3.1

# Specify working directory for this stage
WORKDIR /app

# Tell Docker what command to run when our image is executed inside a container
ENTRYPOINT [ "dotnet", "Worker.dll" ]

# Copy the /out directory from the build stage into the runtime image
COPY --from=builder /app/publish .