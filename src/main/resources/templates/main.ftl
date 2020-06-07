<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по жанру">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0 ml-2">Поиск</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Поделиться книгой
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Введите название книги" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Жанр">
                </div>

                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Выбрать файл</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="custom-photo">
                        <input type="file" name="photo" id="customPhoto">
                        <label class="custom-photo-label" for="customPhoto">Фото (необязательно)</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns" >
        <#list messages as message>
            <div class="card my-3 p-3 w-75">
                <#if message.filename??>
                    <img src="/img/${message.filename}/ " class="card-img-top">
                </#if>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><span>${message.text}</span></li>
                        <li class="list-group-item"><i>${message.tag}</i></li>
                    </ul>
                <div class="card-footer text-muted">
                    От пользователя: ${message.authorName}
                </div>

                <button type="button" class="btn btn-success">Скачать</button>
                <a href="/books/pdf.pdf" target="_blank" class="btn btn-primary">Читать онлайн</a>
                <br>
                <button type="button" class="btn btn-danger">Удалить</button>

            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>