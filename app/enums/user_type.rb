class UserType < ClassyEnum::Base
end

class UserType::Translator < UserType
end

class UserType::Developer < UserType
end

class UserType::ProjectOwner < UserType
end

class UserType::Admin < UserType
end
