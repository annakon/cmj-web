package ru.cmj.domain;

/**
 * Created by akonshina on 09.08.14.
 */
public class User {
    String fio;
    boolean canReq, canRead, canAdmin, canEdit;

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public boolean isCanReq() {
        return canReq;
    }

    public void setCanReq(boolean canReq) {
        this.canReq = canReq;
    }

    public boolean isCanRead() {
        return canRead;
    }

    public void setCanRead(boolean canRead) {
        this.canRead = canRead;
    }

    public boolean isCanAdmin() {
        return canAdmin;
    }

    public void setCanAdmin(boolean canAdmin) {
        this.canAdmin = canAdmin;
    }

    public boolean isCanEdit() {
        return canEdit;
    }

    public void setCanEdit(boolean canEdit) {
        this.canEdit = canEdit;
    }
}
