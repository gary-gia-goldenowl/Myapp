10.times do |i|
    if i < 5
        u = User.create(first_name: "User#{i+1}", last_name: "Last", email: "abc@gmail.com", avatar: "abc.jpg", gender: "male", age: "20", role: "user")
        c = u.categories.create(title: "Category #{i+1}", description:"description #{i+1}")
        p = u.posts.create(category_id: c.id , title: 'abc', content: "bbbb", images:"abc.jpg")
    else 
        u = User.create(first_name: "User#{i+1}", last_name: "Last", email: "abc@gmail.com", avatar: "abc.jpg", gender: "female", age: "19", role: "user")
        c = u.categories.create(title: "Category #{i+1}", description:"description #{i+1}")
        p = u.posts.create(category_id: c.id, title: 'abaaaaaac', content: "mmmmmmmmm", images:"xyz.jpg")
    end
end